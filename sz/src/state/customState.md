# Custom State Management

After using Vuex and Pinia for little while I did not like either one of them

1. Cumbersome to setup
2. Store code becomes a mess quick, Vuex does have modules that you can use but that is an even bigger hassle to setup
3. When stuff goes wrong, like it did with the Composition API then you are stuck and you have to hack things while the people at Vuex come up with an official update.

So I thought, how hard can state management be? It turns out not very hard at all. Basically it comes down to having some global properties, actions, mutations, getters etc that's reactive.

So here is state management by Charl Cronje

## 1. Uninstall Vuex (Feels Good)

```shell
npm uninstall vuex

# Output
# I can never understand NPM, I just uninstalled something but it added 30 packagesm removed 25, changes 58, and ran an audit on 1027 packages and, where is the old days when you did `<scipt src="jqeury.js"></script>` and noone asked for funding
added 30 packages, removed 25 packages, changed 58 packages, and audited 1027 packages in 3m

147 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities
```

## 2. Some boiletplate

- create `/src/store` folder if you don't already have one
- create `/src/store/index.js` file
- create `/src/store/modules` folder

For now I only want state management for user account

- create a file `/src/store/modules/store-account.js` 

## 3. Make `store` with reactive modules

I don't really need a `reactive` store since my `store` is only a `const` with `objects` but I do want those `objects` (`modules`) to be `reactive`

First lets populate the `src/store/index.js` file

```js
// src/store/index.js
import user from './modules/store-account'

const store = {
    user
}

export defaults store;
```

Create a `store-account` module `/src/store/modules/store-account.js` and make it `reactive`
I'm not calling ut store-user or just user becuause I'm be accepting a `user` object into this module and then it will say something like `store.user.user.state` that will suck for me, so I rather create an `account` module. The reason why I call it `store-account` is when I have a lot of `stores` and I type `store` the rest will be `auto-completed` is `VSCode`


```js
// src/store/modules/store-account.js
import { reactive } from 'vue'

const state = reactive({
    authenticated : false
});

export default {
    state
}
```

That was very simple and it's basically a state management system, but now how to I use it and does it work?

## 4. Create `/src/boot/store.js` file

For this store to be available in the entire app I also needed to create another file in the `/src/boot` folder, the boot folder basically contains a broken up `main.js` file. Vue apps have a `main.js` that is responsible for importing all teh global modules but in Quasar they realized that it quickly became a mess just like Vuex did and hey have the concept of a `boot` folder, so all the files + `quasar.conf.js` makes up the `main.js`. So all the files you create in the boot folder must be registered in `quasar.conf.js`.

Add the following to `/src/boot/store.js`

```js
import store from '../store';

export default async ({ app }) => {
    app.provide('store',store);
}
```

## 5. Update `quasar.conf.js`.

```js
module.exports = configure(function (ctx) {
    return {
        // https://quasar.dev/quasar-cli/supporting-ts
        supportTS: false,

        // https://quasar.dev/quasar-cli/prefetch-feature
        preFetch: true,

        // app boot file (/src/boot)
        // --> boot files are part of "main.js"
        // https://quasar.dev/quasar-cli/boot-files
        boot: [
            'axios',
            'store' // Add store
        ],
// the rest of the conf...        
```


## 6. Importing store within a component

In any `.vue` component, in this case `/src/pages/Login.vue`

```vue
<script>
import { inject } from 'vue'

export default {
    name: 'login',
    setup() {
        const store = inject('store')

        return {
            store
        }
    }
}
</script>
```

Every component already has a `<script>` tag with a `name` and `setup()` so the only thing you are really adding is the `const store` and the `return` statement. If you were using `vuex` you would have done something simular but less satisfying.

## 7. Using the `store`

Now you can use the `store` within your `<template></template>`

```vue
<template>
    <div class="login" v-if="store.account.state.authenticated">
        <h1>
            Show me if authenticated
        </h1>
    </div>
</template>
```

I think this makes a lot more sense and no issue with vue or npm or whatever will make this break and cause me to wait for someone else to do something.

Thats it for `vuex` ;) and it does work as expected













