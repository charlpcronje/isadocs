# [Installation](https://laravel-vite.innocenzi.dev/guide/)

## Using the preset

This is the recommended and the easiest approach. The preset can be applied with a single command, without prior installation.

To use it, run the following command at the root of your project:

```
npx apply laravel:vite
```

The preset defaults to installing Vue 3. If you don't want that, you may use the `--no-vue` flag.

Note for Mac users

You will likely get an error because apply is a valid command on your system. You need to either install apply globally with `npm i -g` apply, or use the `--ignore-existing flag.`

The preset will:

Delete `resources/js` and create `resources/scripts`
Delete `webpack.mix.js` and remove the dependency to `laravel-mix`
Add development dependencies on vite and laravel-vite and update package.json's scripts
Add a dependency on `innocenzi/laravel-vite`
Create a vite.config.ts configuration file
Add a call to the `@vite` directive in `welcome.blade.php`
`#Manually`
If you'd rather install Vite manually, you can follow these steps.

First, you need to remove Laravel Mix. You can do that by deleting webpack.mix.js and removing the dependency on laravel-mix. Then, you need to require both the PHP and the Node packages.

## Remove Mix

```shell
rm webpack.mix.js
yarn remove laravel-mix
```

## Require the packages

```shell
composer require innocenzi/laravel-vite
yarn add vite laravel-vite --dev
```

Vite is configured via a vite.config.ts file at the root of your project. Laravel Vite intervenes at this step to integrate with Laravel. For more information about that, read the configuration documentation.

```js
// vite.config.ts
import { defineConfig } from 'laravel-vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig()
    .withPlugin(vue)
    .merge({
        // Your own Vite options
    })
```

Edit your package.json file's scripts property:

````json
"scripts": {
  "dev": "vite",
  "build": "vite build",
  "serve": "vite preview"
}
```

Finally, add the @vite directive to your Blade files