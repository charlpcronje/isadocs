# 5.0.A Apollo Examples

## 5.0.1 Usage example

```vue
# src/pages/Index.vue
<template>
<q-page class="row items-center justify-evenly">
    <div v-if="loading">Loading...</div>
    <div v-else-if="error">Error: {{ error.message }}</div>
    <div v-else-if="result && result.post">
        <div>id: {{ result.post.id }}</div>
        <div>title: {{ result.post.title }}</div>
    </div>

    ...
</q-page>
</template>

<script lang="ts">
  ...
  import { useQuery } from '@vue/apollo-composable'
  import gql from 'graphql-tag'

  export default defineComponent({
    ...
    setup () {
      ...
      const { result, loading, error } = useQuery(gql`
        query getPosts {
          post(id: "3") {
            id
            title
          }
        }
      `)

      return { /* your other items, */ result, loading, error }
    }
  })
</script>
```
## 5.0.2 Multiple apollo clients setup

Un-comment the relevant code in `boot/apollo.(ts|js)`

The following is an example using clientA instead of the default client:

```js
...
const { result, loading, error } = useQuery(gql`
    query getPosts {
    post(id: "3") {
        id
        title
    }
    }
`, null, { clientId: 'clientA' })
...
```