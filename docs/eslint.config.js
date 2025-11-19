const { FlatCompat } = require('@eslint/eslintrc');
const { configs } = require('@docusaurus/eslint-plugin');
const babelParser = require('@babel/eslint-parser');

const compat = new FlatCompat({
  baseDirectory: __dirname,
  recommendedConfig: configs.recommended,
});

module.exports = [
  ...compat.extends('plugin:@docusaurus/recommended'),
  {
    languageOptions: {
      parser: babelParser,
      parserOptions: {
        ecmaVersion: 'latest',
        sourceType: 'module',
      },
    },
  },
];