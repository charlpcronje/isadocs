# Quasar & Quasar Vie Plugin

> Warning! Current limitation:
> SSR builds with Quasar Vite plugin are not yet supported.

__Cross-platform support with Vite is handled by community plugins. These are not tightly integrated with Quasar as with Quasar CLI and may have issues. This is why for the best developer experience we recommend to use Quasar CLI instead. Also, there are plans to release a Quasar CLI with Vite under the hood instead of Webpack.__

## Creating a Vite project

```shell
# yarn
$ yarn create vite my-vue-app --template vue

# or npm 6.x
npm init vite@latest my-vue-app --template vue

# npm 7+, extra double-dash is needed:
npm init vite@latest my-vue-app -- --template vue

# pnpm
pnpm create vite my-vue-app -- --template vue
```

For the official (and full) guide, [please visit the Vite guide](https://vitejs.dev/guide/#scaffolding-your-first-vite-project) for scaffolding a Vite project. **Select “Vue” when asked.**

## Installation

Navigate to your Vite project folder and install the necessary packages.

> TIP
Notice that @quasar/extras is optional.
Also, add sass@1.32.0 (notice the pinned version) only if you want to use the Quasar Sass/SCSS variables

```shell
$ yarn add quasar @quasar/extras
$ yarn add -D @quasar/vite-plugin sass@1.32.0

# or
$ npm install quasar @quasar/extras
$ npm install -D @quasar/vite-plugin sass@1.32.0

# or
$ pnpm add quasar @quasar/extras
$ pnpm add quasar -D @quasar/vite-plugin sass@1.32.0
```

## Using Quasar

We have [built a configurator](https://quasar.dev/start/vite-plugin#using-quasar) to help you get started as quick as possible: