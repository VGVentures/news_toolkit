import babelParser from '@babel/eslint-parser';
import docusaurus from '@docusaurus/eslint-plugin';

export default [
  {
    files: ['**/*.{js,mjs,cjs,jsx}'],
    plugins: {
      '@docusaurus': docusaurus,
    },
    languageOptions: {
      parser: babelParser,
      ecmaVersion: 'latest',
      sourceType: 'module',
    },
    rules: {
      ...docusaurus.configs.recommended.rules,
    },
  },
];
