# Getting Started

> Information Regarding Secure Zone

```js
  ___ ____    _      ____                             _____                
 |_ _/ ___|  / \    / ___|  ___  ___ _   _ _ __ ___  |__  /___  _ __   ___ 
  | |\___ \ / _ \   \___ \ / _ \/ __| | | | '__/ _ \   / // _ \| '_ \ / _ \
  | | ___) / ___ \ _ ___) |  __/ (__| |_| | | |  __/_ / /| (_) | | | |  __/
 |___|____/_/   \_(_)____/ \___|\___|\__,_|_|  \___(_)____\___/|_| |_|\___|
 
```
## What is contained 

Firstly I made sure that the technologies I used are compatible with all the big players and that it can integrate with 
any public API, RestFull or GrapHQL API's are covered, I created a syntax that works works SQL GQL and To do Rest Calls, 
everyone should find is very quick to pick up and to expand on the examples. This is scalable to run in Google Workspace, 
in Share Point, Standalone, Website or Mobile Application. 


## I added files and documentation to easily update and extend the following

- CSS Framework and Adding new rules, utility classes with the help of UNO css and Windy CSS
- Icon Sets that's available to use
  - 'ionicons-v4',
  - 'mdi-v5',
  - 'fontawesome-v5',
  - 'eva-icons',
  - 'themify',
  - 'line-awesome',
  - 'roboto-font-latin-ext',
- An fonts used that is not standard will automatically be sources fro, Google Fonts if the user does not have it installed already.
- Use Rest or Graphql API Both technologies are implemented by and used in the same way.
- Render Server Side or Client Side (You will typically render server side when it is a bot from google or bing, otherwise thy won't be able to index anything)
- Compatible with Quasar, Vue 2, Vue 3, Vue CLi
- Unit testing [Link to Testing Utils](https://vue-test-utils.vuejs.org/). 
- Progressive Web App,
- Single Page Web App
- Browser Extension
- Windows App with Electron
- Android and MacOS
- The Web App 

# The following Tech is used and now works nicely together, this also includes tools to monitor, manage and to deploy 

| 3rd Party Packages                   | Part of the web or Language     |         Tools to assist with the prev two     |
|--------------------------------------|-------------------------------- |-----------------------------------------------| 
| - Web Components                     | - PHP `7.4`                     | Babel, Transpile the code for old devices     |
| - Windi CSS                          |  - CORS (Cross Origin Scripting)| Markdown for the docs                         |
| - Laravel `8.06`                     |  - JavaScript                   |  `Redis` Caching DB                           |
| - Lighthouse (`GraphQL` for Laravel) |  - JavaScript Modules           |  `Yarn` Package Manager for dev dependencies  |
| - Vue.js `3`                         |  - Node`.js`                    |  `Web Pack` + `Vite` tree shaking / compiling |
| - Vue Router                         |  -`MySQL` Database              |  `Composer` PHP Package Manager               |
| - Vue Auth Guard                     |  - Apache Webserver             |  `Git` Version Control                        |
| - Axios (`API Requests`)             |  - CentOS `8`                   |  `Samba`Network File Sharing                  |
| - Quasar `2`                         |  - Browser LocalStorage         | Sass (Pre-Precessed CSS)                      |                     
| - Quasar `Cli`                       |  - and SessionStorage           |                                               |
| - Vite`.js`                          |  - Custom State Management      |                                               |
|  - Passport for Auth                 |                                 |                                               |
| - Quasar Server Side Render          |                                 |                                               |
|  - `Nuxt` TypeScript                 |                                 |                                               |
|  - Pinia Also State Management       |                                 |                                               |


## Custom State Management

I just could not get myself to work with Vuex, it's Vue built in State Management, but it is made for big teams, there are so much 
boilerplate code that it feels you never get to actually doing anything real. I also implemented Pinia State Management. It's also made by Vue, but is made for rapid development in mind and they did away with all the boilerplate code etc.

## Web Sockets

Web Sockets, for push notifications or if you want to monitor something in real time. With web sockets you don't have to make request 
to a server to get something, the communication work both ways so as things change you will know about it.

- It looks like a lot but some of these things are very familiar to most `dev's` and the `docs` are very detailed and not just in 
general or copied from the repo, but it is specific to the project as well and I explain everything I implemented.
- Even though this `app` doesn't do much yet, I think the  technology" used will serve well for a long time and it will be 
upgradeable as well. I do hope to continue working on this, it hooked me now
- The location of all the GIT repos are on a dashboard, the link is below. The Mobile apps can also be compiled and there are 
some releases available for download. And windows and Linux and Apple app is also part of the system but I haven't done a compilation yet.e apps`, Windows App etc
- I also implemented some docker images, just for proof of concept and can be managed in Portainer, The setup for most things are 
quite easy once you done it wrong a few times :) But the they way that worked is noted of course. You will see I also added the things in the docs I ended up not using and reasons for that, that will save someone else the frustration and we learn more from mistakes than to alays do it right the first time 
- From here just make sure you have the following entries in your hosts file

```conf
192.168.9.55        db.dev.isa.co.za                        #1. DB Client or Mysql
192.168.9.55        docs.dev.isa.co.za                      #2. All,contains all the documentation
192.168.9.55        securezone.dev.isa.co.za                #3. This is the main frontend app for secure zone
192.168.9.55        securezone.dev.isa.co.za:5555           #4  This is when I do a dev build, I need to be on the same domain or CORS freaks out again
192.168.9.55        spa.securezone.dev.isa.co.za            #5. Another frontend app, I was testing a bunch of tech together to see what is compatible with what else.
192.168.9.55        pwa.securezone.dev.isa.co.za            #6. Same frontend app as number 1 but with as a pwa
192.168.9.55        ssr.securezone.dev.isa.co.za            #7. Same frontend app as number 1 but with as a SSR
192.168.9.55        api.securezone.dev.isa.co.za            #8. This is the main backend api that serves data to the frontend
192.168.9.55        oauth.securezone.dev.isa.co.za          #9. Public authentication server to be able to use Google, Microsoft, Facebook etc for auth
192.168.9.55        old.securezone.dev.isa.co.za            #10. The prev mockup of securezone
192.168.9.55        gql.securezone.dev.isa.co.za            #11. GraphQL testing platform
```

[Go to Dashboard](http://192.168.9.55:8085)