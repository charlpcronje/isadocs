# 2.1 GraphQL & Axios

## 2.1.1 Vue App

To see this in action create a new Vue application

```shell
vue create graph-demo
```

### 2.1.1.1 Prompt

```shell
Vue CLI v4.5.15
? Please pick a preset:
  Default ([Vue 2] babel, eslint)
> Default (Vue 3) ([Vue 3] babel, eslint)
  Manually select features

# Choose Vue 3

# Press Enter, you will get the following output
✨  Creating project in C:\dev\vue\graph-demo.
�  Initializing git repository...
⚙️  Installing CLI plugins. This might take a while...

yarn install v1.22.17
info No lockfile found.
[1/4] Resolving packages...
[2/4] Fetching packages...

success Saved lockfile.
Done in 76.59s.
�  Invoking generators...
�  Installing additional dependencies...

yarn install v1.22.17
[1/4] Resolving packages...
[2/4] Fetching packages...
[3/4] Linking dependencies...
[4/4] Building fresh packages...

success Saved lockfile.
Done in 20.69s.
⚓  Running completion hooks...

�  Generating README.md...

�  Successfully created project graph-demo.
�  Get started with the following commands:

 $ cd graph-demo
 $ yarn serve
```

## 2.1.2 Install Axios

```shell 
cd graph-demo
yarn add axios

# You should get the following output
$ yarn add axios
yarn add v1.22.17
[1/4] Resolving packages...
[2/4] Fetching packages...
[3/4] Linking dependencies...
[4/4] Building fresh packages...
success Saved lockfile.
success Saved 1 new dependency.
info Direct dependencies
└─ axios@0.24.0
info All dependencies
└─ axios@0.24.0
Done in 6.80s.
```

## 2.1.3 Add some code to query Graphql

- Open `/src/components/HelloWorld.vue` and update the code to the following

```vue
<template>
  <div class="hello">
    <div class="user">
      <ul>
        <li>
          access_token: {{ user.access_token }}
        </li>
        <li>
          refresh_token: {{ user.refresh_token }}
        </li>
        <li>
          expires_in: {{ user.expires_in }}
        </li>
        <li>
          token_type:{{ user.token_type }}
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  name: 'HelloWorld',
  data () {
    return {
      email: 'charl@isa.co.za',
      password: '1234',
      user: {}
    }
  },
  async mounted () {
    console.log('mounted');
    try {
      let result = await axios({
        method: 'POST',
        url: '//api.securezone.co.za.test/gql',
        data: {
          query: `mutation {
            login(input: {
              username: "charl@isa.co.za",
              password: "1234"
            }) {
              access_token
              refresh_token
              expires_in
              token_type
              user {
                id
                email
                name
                created_at
                updated_at
              }
            }
          }`
        }
      });
      this.user = result.data.data.login
    } catch (error) {
      console.log(error);
    }
  }

}
</script>
```

## 2.1.4 Run Dev Server

```shell
yarn serve
```

Open your browser and go to `http://localhost:8080`

This would have logged in a user and retrieved an API Token
