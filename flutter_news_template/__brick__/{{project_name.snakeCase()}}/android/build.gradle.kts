allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

// Temporary workaround for third-party Android modules that still do not set
// an explicit namespace. Remove once upstream dependencies are updated.
// https://github.com/0maru/twitter_login/issues/140
subprojects {
    pluginManager.withPlugin("com.android.library") {
        val androidExtension = extensions.findByName("android") ?: return@withPlugin
        val androidClass = androidExtension.javaClass
        val getNamespace = runCatching { androidClass.getMethod("getNamespace") }.getOrNull() ?: return@withPlugin
        val setNamespace =
            runCatching { androidClass.getMethod("setNamespace", String::class.java) }.getOrNull() ?: return@withPlugin

        val namespace = getNamespace.invoke(androidExtension) as? String
        if (namespace.isNullOrBlank()) {
            setNamespace.invoke(androidExtension, project.group.toString())
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
