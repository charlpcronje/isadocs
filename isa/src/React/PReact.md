# PReact - Fast 3kB alternative to React with the same modern API

- [PReact - Fast 3kB alternative to React with the same modern API](#preact---fast-3kb-alternative-to-react-with-the-same-modern-api)
  - [See it in action](#see-it-in-action)
    - [Todo List Example](#todo-list-example)
    - [Fetch GitHub Stars](#fetch-github-stars)
  - [Getting Started](#getting-started)
    - [Best practices powered by Preact CLI](#best-practices-powered-by-preact-cli)
  - [Getting ready for development](#getting-ready-for-development)
    - [Making a production build](#making-a-production-build)
    - [Aliasing React to Preact](#aliasing-react-to-preact)
    - [Aliasing in webpack](#aliasing-in-webpack)
    - [Aliasing in Parcel](#aliasing-in-parcel)
    - [Aliasing in Rollup](#aliasing-in-rollup)
    - [Aliasing in Jest](#aliasing-in-jest)
    - [Aliasing in Snowpack](#aliasing-in-snowpack)
    - [TypeScript preact/compat configuration](#typescript-preactcompat-configuration)
    - [preact-default-boilerplate](#preact-default-boilerplate)
      - [Usage](#usage)
      - [Commands](#commands)
      - [How to Test](#how-to-test)


> Preact provides the thinnest possible Virtual DOM abstraction on top of the DOM. It builds on stable platform features, registers real event handlers and plays nicely with other libraries.
> Preact can be used directly in the browser without any transpilation steps.

__Closer to the DOM__
Preact provides the thinnest possible Virtual DOM abstraction on top of the DOM. It builds on stable platform features, registers real event handlers and plays nicely with other libraries.

Preact can be used directly in the browser without any transpilation steps.

__Small Size__
Most UI frameworks are large enough to be the majority of an app's JavaScript size. Preact is different: it's small enough that your code is the largest part of your application.

That means less JavaScript to download, parse and execute - leaving more time for your code, so you can build an experience you define without fighting to keep a framework under control.

__Big Performance__
Preact is fast, and not just because of its size. It's one of the fastest Virtual DOM libraries out there, thanks to a simple and predictable diff implementation.

We automatically batch updates and tune Preact to the extreme when it comes to performance. We work closely with browser engineers to get the maximum performance possible out of Preact.

__Portable & Embeddable__
Lightweight is a lot more fun when you don't have to sacrifice productivity to get there. Preact gets you productive right away. It even has a few bonus features:

- `props`, `state` and `context` are passed to `render()`
Use standard HTML attributes like `class` and `for`

__Ecosystem Compatible__
Virtual DOM Components make it easy to share reusable things - everything from buttons to data providers. Preact's design means you can seamlessly use thousands of Components available in the React ecosystem.

Adding a simple [preact/compat](https://preactjs.com/guide/v10/switching-to-preact#how-to-alias-preact-compat) alias to your bundler provides a compatibility layer that enables even the most complex React components to be used in your application.

## See it in action

### Todo List Example

```JS
export default class TodoList extends Component {
    state = { todos: [], text: '' };
    setText = e => {
        this.setState({ text: e.target.value });
    };
    addTodo = () => {
        let { todos, text } = this.state;
        todos = todos.concat({ text });
        this.setState({ todos, text: '' });
    };
    render({ }, { todos, text }) {
        return (
            <form onSubmit={this.addTodo} action="javascript:">
                <label>
                  <span>Add Todo</span>
                  <input value={text} onInput={this.setText} />
                </label>
                <button type="submit">Add</button>
                <ul>
                    { todos.map( todo => (
                        <li>{todo.text}</li>
                    )) }
                </ul>
            </form>
        );
   
```

Running Example

```JS
import TodoList from './todo-list';
```

### Fetch GitHub Stars

```JS
export default class Stars extends Component {
    async componentDidMount() {
        let stars = await githubStars(this.props.repo);
        this.setState({ stars });
    }
    render({ repo }, { stars=0 }) {
        let url = `https://github.com/${repo}`;
        return (
            <a href={url} class="stars">
                ⭐️ {stars} Stars
            </a>
        );
    }
}
```

Running Example

```JS
import Stars from './stars';
```

## Getting Started

### Best practices powered by Preact CLI

[Preact CLI](https://github.com/preactjs/preact-cli) is an off-the-shelf solution for building Preact applications that is optimized for modern web development. It's built on standard tooling projects like Webpack, Babel and PostCSS. Preact CLI does not require any configuration or prior knowledge to get started, and this simplicity makes it the most popular way to use Preact.

As the name implies, Preact CLI is a command-line tool that can be run in the terminal on your machine. Using it, you can create a new application by running the `create` command:

```ps
npx preact-cli create default my-project
```

This will create a new application based on our `default template`. You will be asked for some information about your project, which will then be generated in the directory you specified (`my-project` in this case).

> __Tip:__ Any GitHub repository with a template/ folder can be used as a custom template:
> npx preact-cli create <username>/<repository> <project-name>

## Getting ready for development
Now we're ready to start our application. To start a development server, run the following command inside your newly generated project folder (`my-project` from above):

```shell
# Go into the generated project folder
cd my-project

# Start a development server
npm run dev
```

Once the server has started, it will print a local development URL to open in your browser. Now you're ready to start coding your app!

### Making a production build
There comes a time when you need to deploy your app somewhere. The CLI ships with a handy build command which will generate a highly-optimized production build.

```shell
npm run build
```

Upon completion, you'll have a new `build/` folder which can be deployed directly to a server.

> For a full list of all available commands, check out the Preact [CLI Documentation.](https://github.com/preactjs/preact-cli#cli-options)

Integrating Into An Existing Pipeline
If you already have an existing tooling pipeline set up, it's very likely that this includes a bundler. The most popular choices are [webpack](https://webpack.js.org/), [rollup](https://rollupjs.org/) or [parcel](https://parceljs.org/). Preact works out of the box with all of them. No changes needed!

Setting up JSX
To transpile JSX, you need a Babel plugin that converts it to valid JavaScript code. The one we all use is [@babel/plugin-transform-react-jsx](https://babeljs.io/docs/en/babel-plugin-transform-react-jsx). Once installed, you need to specify the function for JSX that should be used:

```JSON
{
  "plugins": [
    ["@babel/plugin-transform-react-jsx", {
      "pragma": "h",
      "pragmaFrag": "Fragment",
    }]
  ]
}
```

> [Babel](https://babeljs.io/) has some of the best documentation out there. We highly recommend checking it out for questions surrounding Babel and how to set it up.

### Aliasing React to Preact

At some point, you'll probably want to make use of the vast React ecosystem. Libraries and Components originally written for React work seamlessly with our compatibility layer. To make use of it, we need to point all `react` and `react-dom` imports to Preact. This step is called aliasing.

### Aliasing in webpack

To alias any package in webpack, you need to add the resolve.alias section to your config. Depending on the configuration you're using, this section may already be present, but missing the aliases for Preact.

```JSON
const config = { 
   //...snip
  "resolve": { 
    "alias": { 
      "react": "preact/compat",
      "react-dom/test-utils": "preact/test-utils",
      "react-dom": "preact/compat",     // Must be below test-utils
      "react/jsx-runtime": "preact/jsx-runtime"
    },
  }
}
```

### Aliasing in Parcel

Parcel uses the standard package.json file to read configuration options under an alias key.

```JSON
{
  "alias": {
    "react": "preact/compat",
    "react-dom/test-utils": "preact/test-utils",
    "react-dom": "preact/compat",
    "react/jsx-runtime": "preact/jsx-runtime"
  },
}
```

### Aliasing in Rollup

To alias within Rollup, you'll need to install @rollup/plugin-alias. The plugin will need to be placed before your @rollup/plugin-node-resolve

```JS
import alias from '@rollup/plugin-alias';

module.exports = {
  plugins: [
    alias({
      entries: [
        { find: 'react', replacement: 'preact/compat' },
        { find: 'react-dom/test-utils', replacement: 'preact/test-utils' },
        { find: 'react-dom', replacement: 'preact/compat' },
        { find: 'react/jsx-runtime', replacement: 'preact/jsx-runtime' }
      ]
    })
  ]
};
```

### Aliasing in Jest

Jest allows the rewriting of module paths similar to bundlers. These rewrites are configured using regular expressions in your Jest configuration:

```JSON
{
  "moduleNameMapper": {
    "^react$": "preact/compat",
    "^react-dom/test-utils$": "preact/test-utils",
    "^react-dom$": "preact/compat",
    "^react/jsx-runtime$": "preact/jsx-runtime"
  }
}
```

### Aliasing in Snowpack
To alias in Snowpack, you'll need to add a package import alias to the snowpack.config.mjs file.

```JS
// snowpack.config.mjs
export default {
  alias: {
    "react": "preact/compat",
    "react-dom/test-utils": "preact/test-utils",
    "react-dom": "preact/compat",
    "react/jsx-runtime": "preact/jsx-runtime",
  }
}
```

### TypeScript preact/compat configuration

Your project could need support for the wider React ecosystem. To make your application compile, you'll need to disable type checking on your node_modules like this. This way, your alias will work properly when libraries import React.

```JSON
{
  ...
  "skipLibCheck": true,
}
```

### preact-default-boilerplate

#### Usage

```shell
npx preact-cli create default my-project
cd my-project
npm install
npm run dev
```

Development server runs on port 8080. If the default port is already in use on your machine it will start the development server on a random port.

#### Commands

- npm run dev: Run a development, HMR server
- npm run serve: Run a production-like server
- npm run build: Production-ready build
- npm run lint: Pass JavaScript files using ESLint
- npm run test: Run Jest and Enzyme with [enzyme-adapter-preact-pure](https://github.com/preactjs/enzyme-adapter-preact-pure) for your tests

#### How to Test

The `default` template provides a basic test setup with Jest, Enzyme, and [enzyme-adapter-preact-pure](https://github.com/preactjs/enzyme-adapter-preact-pure). You are free to change Enzyme with any other testing library (eg. [Preact Testing Library](https://testing-library.com/docs/preact-testing-library/intro)).

You can run all additional Jest CLI commands with the `npm run test` command as described in the Jest docs. For example, running jest in watch mode would be :

`npm run test -- --watch` instead of `jest --watch`

__Fork It And Make Your Own__
You can fork this repo to create your own boilerplate, and use it with `preact-cli`:

```shell
preact create username/repo my-project
```
