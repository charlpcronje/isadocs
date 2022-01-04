# Secure Zone

```js

  ___ ____    _      ____                             _____                
 |_ _/ ___|  / \    / ___|  ___  ___ _   _ _ __ ___  |__  /___  _ __   ___ 
  | |\___ \ / _ \   \___ \ / _ \/ __| | | | '__/ _ \   / // _ \| '_ \ / _ \
  | | ___) / ___ \ _ ___) |  __/ (__| |_| | | |  __/_ / /| (_) | | | |  __/
 |___|____/_/   \_(_)____/ \___|\___|\__,_|_|  \___(_)____\___/|_| |_|\___|
 
```

Documentation
The implementation of this API and the client side app can be found on git hub:

To serve these docs as a website: <https://github.com/isa-holdings/securezone.client>

To Generate this documentation to a standalone website:

```shell
npm i docsify-cli -g
docsify init
```

[Docsify Docs](https://docsify.js.org/#/quickstart)

- [**&#10004;**] Important for the project to work
- [ **?** ] Any one of these can be used
- [**&#10008;**] Are viable alternatives but decided against them
- [&#128220;] Link contains internal documentation
- [&#128249;] Link contains a video
- [&#128206;] Link to External documentation

Here are a list of all the tech used with their official docs, added short docs for each module that is relative to the project further down with install instructions and basic examples.

## Technologies

- HTML
  - [HTML 5](https://www.w3schools.com/html/)
  - [Web Components](webComponents.org)
- CSS
  - [Sass](https://sass-lang.com/)
  - [UNO CSS](https://github.com/antfu/unocss)A
  - [Windi CSS](https://github.com/windicss/windicss)
  - [Critters](https://github.com/GoogleChromeLabs/critters)
  - [Unplugin](https://github.com/antfu/unplugin-icons)
- [PHP 7.4](https://www.php.net/)
  - [Laravel](https://laravel.com/)
  - [Lighthouse](https://lighthouse-php.com/)
  - [Sanctum](https://laravel.com/8.x/sanctum)
  - [CORS](https://lighthouse-php.com/5/getting-started/configuration.html#cors)
- [JavaScript (ES 2016)](https://www.javascript.com/)
  - JavaScript Modules
  - [Vue.js 3](https://vuejs.org/)
    - Vue Templates
    - [Vue Router](https://router.vuejs.org/)
    - [Vue Apollo for GraphQL](https://apollo.vuejs.org/)
    - [Vuex for State Management](https://next.vuex.vuejs.org/) or
    - [Pinia For State Management](https://pinia.esm.dev/introduction.html)
  - [Quasar](https://quasar.dev/)
  - [Quasar form Builder](https://github.com/baggachipz/q-form-builder-demo)
  - [Vite](https://vitejs.dev/)
  - [Vite Plugin Markdown](https://github.com/antfu/vite-plugin-md)
  - [Vite Server Side Rendering](https://vitejs.dev/guide/ssr.html)
  - [TypeScript](https://www.typescriptlang.org/)
  - [@vueuse/head](https://github.com/vueuse/head)
- [Node.js](https://nodejs.org/)
  - [NVM (Node version manager)](https://github.com/mvm-sh/nvm)
  - [Vite](https://vitejs.dev/)
  - [Quasar CLi](https://quasar.dev/)
- Database
  - [MySQL](https://www.mysql.com/)
  - [Redis](https://redis.io/)
- API
  - [GraphQL API](https://graphql.org/)
- Package Managers
  - [NPM / PNPM](https://www.npmjs.com/) or
  - [Yarn](https://yarnpkg.com/)
  - [Composer](https://getcomposer.org/)
- [Apache](https://www.apache.org/)
- [CentOS 8](https://www.centos.org/)
  - [Samba](https://www.linuxtechi.com/install-configure-samba-centos-8/)
- Version Control
  - [Git](https://git-scm.com/)

For each component there are installation instructions, usage instructions with some examples and where to get more help if needed

The checkboxes next to each item is the ones chose to use in the end. I also mention some other packages that I did not implement yet or nessesarily will, but some packages I sort of stumbled upon as I was reaching this and they sounded like they had something secial to offer.

## 1. CentOS 8

First we need to setup the CentOS 8 Server. There are quite a few steps. The items that is not checked is optional

- [**&#10004;**][&#128220;] [1.1 CentOS Install](/secureZone/centOS/1.1-centOSInstall.md)
- [**&#10004;**][&#128220;] [1.2 Firewall](/secureZone/centOS/1.2-firewall.md)
- [ **?** ][&#128220;] [1.3 Midnight Commander](/secureZone/centOS/1.3-midnightCommander.md)
- [ **?** ][&#128220;] [1.4 Disable SE Linux](/secureZone/centOS/1.4-seLinux.md)
- [**&#10004;**][&#128220;] [1.5 Install Mysql](/secureZone/centOS/1.5-mysql.md)
- [**&#10004;**][&#128220;] [1.6 Install PHP](/secureZone/centOS/1.6-php.md)
- [**&#10004;**][&#128220;] [1.7 Install Composer](/secureZone/centOS/1.7-composer.md)
- [**&#10004;**][&#128220;] [1.8 A Install Node.js](/secureZone/centOS/1.8-nodejs.md)
- [ **?** ][&#128220;] [1.8 B Instal Node.js with NVM](/secureZone/centOS/1.8-nvm.md)
- [ **?** ][&#128220;] [1.9 Install Yarn](/secureZone/centOS/1.9-yarn.md)
- [**&#10004;**][&#128220;] [1.10 Apache](/secureZone/centOS/1.10-apache.md)
- [**&#10004;**][&#128220;] [1.11 Git Install](/secureZone/centOS/1.11-git.md)
- [**&#10004;**][&#128220;] [1.12 Install Samba](/secureZone/centOS/1.12-samba.md)
- [ **?** ][&#128220;] [1.13 Set Static IP](/secureZone/centOS/1.13-networkSetStatic.md)

## 2. Virtual Hosts

> Setting up the virtual hosts has a trick to it when it comes to setting up sub-domains

Secure Zone runs as an API and as a client from two different `VHOSTS` so lets setup the `VHOSTS`

- [**&#10004;**][&#128220;] [2.1 Create the Directory Structure](/secureZone/vhosts/2.1-structure.md)
- [**&#10004;**][&#128220;] [2.2 Grant Permissions](/secureZone/vhosts/2.2-permissions.md)
- [ **?** ][&#128220;] [2.3 Create Demo Pages for the Virtual Hosts](/secureZone/vhosts/2.3-demoPages.md)
- [**&#10004;**][&#128220;] [2.4 Set Up Local Hosts File](/secureZone/vhosts/2.4-hostsFile.md)
- [**&#10004;**][&#128220;] [2.5 Create New Virtual Host Files](/secureZone/vhosts/2.5-createConfFiles.md)
- [**&#10004;**][&#128220;] [2.6 .htaccess file for Apps using `history` mode not `hash` mode](/secureZone/vhosts/2.6-htaccess.md)

## 3. API with Laravel

In this section you only have to install 3.1 to 3.4. I explored the rest of the options but in the end Passport won yhe race.

Here is detailed instructions for passport auth:

- [**&#10004;**][&#128220;] [3.0 Login with Passport](/secureZone/API/3.0-loginWithPassport.md)

> Auth system

- [**&#10004;**][&#128220;] [3.1 Install Laravel via Composer](/secureZone/API/3.1-installWithComp.md)
- [**&#10004;**][&#128220;] [3.2 GraphQL with Laravel and Lighthouse](/secureZone/API/3.2-graphql.md)
- [**&#10004;**][&#128220;] [3.1 Install Lighthouse on API](/secureZone/API/3.3-lighthouse.md)
- [**&#10004;**][&#128220;] [3.4 Passport Authentication](/secureZone/API/3.4-passportAuth.md)
- [**&#10008;**][&#128220;] [3.5 Sanctum Authentication](/secureZone/API/3.5-sanctum.md)
- [**&#10008;**][&#128220;] [3.6 Auth with Bearer Token](/secureZone/API/3.6-bearerAuth.md)
- [ **?** ][&#128220;] [3.7 Google 2FA](/secureZone/API/3.7-2fa.md)
- [**&#10004;**][&#128220;] [3.8 Laravel DB Setup](/secureZone/API/3.8-data.md)
- [ **?** ][&#128220;] [3.9 GraphQL Tools](/secureZone/API/3.9-graphqlTools.md)
- [ **?** ][&#128220;] [3.10 Youtube Tutorial](/secureZone/API/3.10-youtube.md)
- [ **?** ][&#128220;] [3.11 Laravel Artisan GUI](/secureZone/API/3.11-artisanGui.md)
- [ **?** ][&#128220;] [3.12 Laravel Sanctum / Vue Apollo Authentication](/secureZone/API/3.12-sanctumApollo.md)
- [**&#10004;**][&#128220;] [3.13 User Permission Through Roles](/secureZone/API/3.13-permissionRoles.md)

> Old secure zone laravel changes to get the old.secureZone to work

- [ **?** ][&#128220;] [3.7 2 FA Implementation](/secureZone/API/3.7-2fa.md)

## 4. SecureZone Client Website

What I wanted to use is Vite, whatever I used with Vite does not matter and does not make any real difference, you can literally create one page with Vue and the next with Svelte and the next with React and the next with Lit-Element because Vite supports them all.

So the first JS Lib to install is Vite, when you install Vite it asks you which other lib you will be using, in this case I actually decided to go with Vue.js because it's got a smaller learning curve for future developers and has a good community and thousands of plugins and good support, you can use lit-element anywhere in between as it uses native web-components so it will have no influence.

- [ **?** ][&#128220;] [4.0 Vite Lit-Element](/secureZone/client/4.0-litElement.md)
- [**&#10004;**][&#128220;] [4.1 Install Vue 3 CLI](/secureZone/client/4.1-vue.md)
- [**&#10004;**][&#128220;] [4.2 Vite and Quasar](/secureZone/client/4.2-viteQuasar.md)
- [**&#10004;**][&#128220;] [4.3 Sass Variables](/secureZone/client/4.3-sassVars.md)
- [**&#10004;**][&#128220;] [4.4 Uno CSS](/secureZone/client/4.4-unoCss.md)
- [**&#10008;**][&#128220;] [4.5 Vue Apollo](/secureZone/client/4.5-vueApollo.md)
- [**&#10004;**][&#128220;] [4.6 Vue Router](/secureZone/client/4.6-vueRouter.md)
- [**&#10008;**][&#128220;] [4.7 Vue Auto Routes](/secureZone/client/4.7-vueAutoRoutes.md)
- [**&#10004;**][&#128220;] [4.8 Vue Guards - Restrict Access](/secureZone/client/4.8-vueGuards.md)
- [**&#10008;**][&#128220;] [4.9 Vuex Data Store](/secureZone/client/4.9-vuexDataStore.md)
- [**&#10008;**][&#128220;] [4.10 Vite Markdown Plugin](/secureZone/client/4.10-vitePluginMd.md)
- [**&#10008;**][&#128220;] [4.11 VueUse Head](/secureZone/client/4.11-VueUseHead.md)
- [**&#10004;**][&#128220;] [4.12 Quasar Cli](/secureZone/client/4.12-quasarCli.md)
- [**&#10008;**][&#128220;] [4.13 CSS Tips](/secureZone/client/4.13-cssTips.md)
- [**&#10004;**][&#128220;] [4.14 Pinia](/secureZone/client/4.14-piniaStateAndStore.md)
- [**&#10004;**][&#128220;] [4.15 Critters CSS](/secureZone/client/4.15-critters.md)
- [**&#10004;**][&#128220;] [4.16 Quasar dotenv](/secureZone/client/4.16-dotenv.md)
- [ **?** ][&#128220;] [4.17 Quasar form builder](/secureZone/client/4.17-quasarFormBuilder.md)
- [ **?** ][&#128220;] [4.18 GraphQL Vanilla JS](/secureZone/client/4.18-NoFramworkGraphQL.md)
- [**&#10008;**][&#128220;] [4.19 `$apollo` outside vue component?](/secureZone/client/4.19-apolloOutsideVue.md)

## 5. Some apps to learn all about GraphQL

After now trying to integrate apollo for the 3rd time and still not working as expected and not even compiling, I decided to not waste another second on Apollo,

- [ **?** ][&#128220;] [5.0.A Apollo Examples](/secureZone/examples/apollo.md)

I am now using Axios to perform the Graph Queries together with a package the converts JSON to Queries

- [**&#10004;**][&#128220;] [5.0.B Example App](/secureZone/examples/axios.md)
- [**&#10004;**][&#128220;] [5.0.C json-to-graphql-query](/secureZone/examples/jsonToGraphql.md)

## The rest og the graph Resources I concidered

- [**&#10004;**][&#128220;] [5.1 Local dev Server X11 Forwarding](/secureZone/tools/5.1-x11forwarding.md)
- [**&#10004;**][&#128220;] [5.2 Vue GraphQL Tools & tutorials](/secureZone/tools/5.2-vueGraphQLResources.md)
- [ **?** ][&#128220;] [5.3 Scalable GraphQL server + Tooling and testing](/secureZone/tools/5.3-graphqlServerAndTools.md)
- [**&#10004;**][&#128220;] [5.4 GraphQL Electron Windows PLayground](/secureZone/tools/5.4-grapthQLElectron.md)
- [**&#10004;**][&#128220;] [5.5 GraphQL Learning](/secureZone/tools/5.5-learingGraphQL.md)
- [ **?** ][&#128206;] [5.6 GraphQL Code Generator](https://github.com/dotansimha/graphql-code-generator)
- [**&#10008;**][&#128220;] [5.7 Apollo Client Dev Tools](tools/5.7-apolloDevTools.md)
- [**&#10004;**][&#128220;] [5.8 Altair GraphQL Cross Platform Client](/secureZone/tools/5.8-altairGraphQL.md)
- [**&#10004;**][&#128220;] [5.9 Creating GraphQL Queries with Laravel](/secureZone/tools/5.9-creatingGQLueries.md)
- [ **?** ][&#128220;] [5.10 GraphQL Links and Options](/secureZone/tools/5.10-GQLFrameworkLinks.md)
- [**&#10004;**][&#128220;] [5.11 Simplest GraphQL IDE with only CDN inlcudes](/secureZone/tools/5.11-GraphQLIDECDN.md)
- [ **?** ][&#128220;] [5.12 GraphQL Live Query](/secureZone/tools/5.12-graphQLiveQuery.md)
- [ **?** ]][&#128206;] [5.13 Go GraphQL](https://github.com/hasura/go-graphql-client)
- [ **?** ][&#128206;] [5.14 GraphQL PHP with out Laravel](https://github.com/webonyx/graphql-php)
- [ **?** ][&#128206;] [5.15 Graph in Standalone PHP GraphQL Server](https://github.com/infinityloop-dev/graphpinator)

## 6. Documentation for some Tools used

- [**&#10004;**][&#128220;] [6.1 Quasar Command List](/secureZone/quasar/6.1-commandList.md)
- [**&#10004;**][&#128220;] [6.2 Quasar boot files](/secureZone/quasar/6.2.A-bootFiles.md)
- [**&#10004;**][&#128220;] [6.2 Quasar boot Plugin](/secureZone/quasar/6.2.B-bootPlugin.md)
- [**&#10004;**][&#128220;] [6.3 Quasar Pre-fetch Feature](/secureZone/quasar/6.3-quasarPrefetch.md)
- [**&#10004;**][&#128220;] [6.4 Handling Assets](/secureZone/quasar/6.4-quasarAssets.md);
- [**&#10004;**][&#128220;] [6.5 API Proxying for Dev](/secureZone/quasar/6.5-apiProxy.md)
- [**&#10004;**][&#128220;] [6.6 .env Processing](/secureZone/quasar/6.6-envProcess.md)
- [**&#10004;**][&#128220;] [6.7 Deploying a SPA](/secureZone/quasar/6.7-deployingOrBuilding.md)
- [**&#10004;**][&#128220;] [6.8 Open dev to Public](/secureZone/quasar/6.8-devForPublic.md)
- [**&#10004;**][&#128220;] **6.9 Quasar Components**
- [**&#10008;**][&#128220;] [6.9.1 QSkeleton](/secureZone/quasar/6.9.1-qSkeleton.md)
- [**&#10004;**][&#128220;] [6.9.2 QMarkdown](/secureZone/quasar/6.9.2-qMarkdown.md)
- [**&#10004;**][&#128220;] [6.9.3 Testing](/secureZone/quasar/6.9.3-quasarTesting.md)
- [**&#10004;**][&#128220;] [6.10 Sass Vars in JS](/secureZone/quasar/6.10-SassInJs.md)

## 7. Some hacks & Time savers

- [**&#10008;**][&#128220;] [7.1 Graphql Mysql Schema](/secureZone/hacks/7.1-graphqlMysqlSchema.md)
- [**&#10004;**][&#128220;] [7.2 CORS (Cross-origin resource sharing)](/secureZone/hacks/7.2-cors.md)
- [**&#10004;**][&#128220;] [7.3 Static Site generator for docs](/secureZone/hacks/7.3-staticSiteGen.md)
- [**&#10004;**][&#128220;] [7.4 Quasar Global Components](/secureZone/hacks/7.4-globalComponents.md)
- [**&#10004;**][&#128220;] [7.5 Vue Web Storage](/secureZone/hacks/7.5-vueWebStorage.md)

## 8. Axios

- [**&#10004;**][&#128220;] [8.1 Install](/secureZone/axios/8.1-install.md)
- [**&#10004;**][&#128220;] [8.2 Axios Config](/secureZone/axios/8.2-config.md)
- [**&#10004;**][&#128220;] [8.3 The Axios Instance](/secureZone/axios/8.3-instance.md)
- [**&#10004;**][&#128220;] [8.4 Axios API](/secureZone/axios/8.4-api.md)
- [**&#10004;**][&#128220;] [8.5 POST Requests](/secureZone/axios/8.5-posts.md)
- [**&#10004;**][&#128220;] [8.6 Minimal Example](/secureZone/axios/8.6-minExample.md)

## 9. Monitoring, Testing, Validation

- [**&#10004;**][&#128220;] [9.1-Make API](/secureZone/misc/9.1-makeAPI.md)
- [**&#10004;**][&#128220;] [9.2 Generate UUID](/secureZone/misc/9.2-uuid.md)
- [**&#10004;**][&#128206;] [9.3 Log Rocket](https://docs.logrocket.com/docs)
- [**&#10004;**][&#128220;] [9.4 Validation with Typescript & Decorators](misc/9.4=typeValidation.md)
- [**&#10004;**][&#128220;] [9.5 Strongly-typed destructuring TypeScript](misc/9.5-typeDestructuringTS.md)
- [**&#10004;**][&#128249;] [9.6 Using TypeScript Class Components in NativeScript Vue](https://www.youtube.com/watch?v=u8lMkgb-8iA)
- [**&#10004;**][&#128249;] [9.7 Date-fns](/secureZone/misc/9.7-dateFns.js.md)
- [**&#10004;**][&#128249;] [9.8 Deno](/secureZone/'misc/9.8-deno.md')

## 10. OAuth

I will attempt in implement OAuth in the the application, this is by far the best authentication you can have, it is compatible with every platform and application type.<https://github.com/peterpetrus/passport-token>

## 11. Laravel Socialite

- [**&#10004;**][&#128220;][10.1 Install Socialite](/secureZone/oauth/installSocialite.md)

## 12. Deploy SPA, PWA, APK, Electron

- [**&#10004;**] [Files to update](/secureZone/deploy/12.1-filesToUpdate.md)
- [**&#10004;**] [Quasar Build](/secureZone/deploy/12.2-quasarBuild.md)
- [**&#10004;**] [Quasar Commands](/secureZone/deploy/12.3-quasarCommands.md)
- [**&#10004;**] [Deploy to Git](/secureZone/deploy/12.4-deployToGit);
- [**&#10004;**] [Compilation Guide](/secureZone/deploy/12.5-guideAppCompile.md);
