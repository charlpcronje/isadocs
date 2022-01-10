## 1.1 Composition API

### 1.1.1 Some usefull functions

*watchEffect*

> Watch Effect will be exectuted every time any one of the dependencies of the variable changes
```js
export default {
    setup() {
        const count = ref(0);

        watchEffect(()=> {
            console.log('Value of count: {count.value}');
        });
        return { count }
    }
} 
```

*watch*

> Also wathes a ref and gives you access to the current and prev value. You can watch a rer directly or a getter of a ref
> watch an take a ref or an array of refs
```js
export default {
    setup() {
        const counter = reactive({ count: 0 })
        watch(
            () => counter.count,
            (curr,prev) => {/** dostuff **/}
        ) 

        const count = ref(0
        watch(
            count,
            (curr,perv) => {/** dostuff **/}
        )
    }
}
```

*Lifecycle hooks*
> One example of a lifecycle hook is the `onMounted` function 