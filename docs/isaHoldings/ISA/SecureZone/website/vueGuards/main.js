import { createApp } from 'vue';
import { createStore } from 'vuex'
import { createWebHistory, createRouter } from "vue-router";
import App from './App.vue';
import Login from "./components/Login.vue";
import Secure from "./components/Secure.vue"


const store = createStore({
    state: {
        authenticated: false
    },
    mutations: {
        setAuthentication(state,status) {
            state.authenticated = status;
        }
    }
})

const router = createRouter({
    history: createWebHistory(),
    routes: [
        {
            path: '/',
            redirect : {
                name: 'login'
            }
        },
        {
            path: "/login",
            name: 'login',
            component: Login
        },
        {
            path: '/secure',
            name: 'secure',
            component: Secure,
            beforeEnter: (to, from, next) => {
                if (store.state.authenticated == false) {
                   next("/login"); 
                } else {
                    next();
                }
            }
        }
    ]
});
    

createApp(App)
    .use(store)
    .use(router)
    .mount('#app');
