
# 8.1 File to Update

Open the following files and make sure the settings are still correct

## 8.1.1 Update `quasar.extensions.json`

I'm using `laragon` as my local web server and it auto creates `vhosts` for every folder inside the `www` directory and it adds `.test` after each `vhost` it also auto updates your windows `hosts` file with the corrosponding entries
Laragon can be found at: [https://laragon.org/](https://laragon.org/)

```json
{
  "@quasar/apollo": {
    "graphql_uri": "http://api.securezone.co.za.test/gql"
  }
}
```

## 8.1.2 Update `apollo.config.js`

```js
client: {
    service: {
      name: 'securezone-service',
      url: 'http://api.securezone.co.za.test/gql',
    },
    // Files processed by the extension
    includes: ['src/**/*.vue', 'src/**/*.js', 'src/**/*.ts'],
  },
```

## 8.1.3 Update `dev.env`

```conf
GRAPHQL_URI=http://api.securezone.co.za.test/gql
```
