import { FlatCompat } from '@eslint/eslintrc';
import { configs } from '@docusaurus/eslint-plugin';
import babelParser from '@babel/eslint-parser';

const compat = new FlatCompat({
    baseDirectory: __dirname,
    recommendedConfig: configs.recommended,
});

export default [
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