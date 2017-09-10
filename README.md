# Idea Inbox 📬 - Elm edition

_Note: I'm still building this! There's a lot missing, but it's coming together._

Idea Inbox is a simple example web app that prompts the user for ideas around a topic and allows them to vote in previously suggested ideas.

It serves as an example application for people to try out new languages and frameworks.

## Idea Inbox 📬 basics

[Read the basics here](https://github.com/pgaspar/idea-inbox-sinatra#idea-inbox--basics).

## TODO ✅

- [ ] Support submitting new ideas
- [ ] Actually make the vote up/down buttons do things
- [ ] Improve styling / layout
- [ ] ...

## Elm edition stack

This Idea Inbox edition is built using Elm. I used both the [Elm Guide](guide.elm-lang.org) and the [Elm Tutorial](https://www.elm-tutorial.org) as basis for this work.

* Elm 0.18.0
* Webpack
* [json-server](https://github.com/typicode/json-server) - provides a fake REST API & backend that persists data on a JSON file
* Foreman - to run both client & backend servers without assle
* [Basscss](http://basscss.com) - Helpful low level css toolkit. I'm still understanding how it works.
* A few other Elm packages you can find on `elm-package.json`

To run the app, make sure you install everything and then `yarn start`.

## Contributing

I'm still discovering Idea Inbox and I'd be very excited to do it with other people!

I'll be pushing a few other implementations soon(ish) as I explore other technologies, but please share your implementations as well!

Comments, suggestions, other implementations, etc. will be very welcome.

## Acknowledgments

Idea Inbox 📬 is based on [oquefaltaemcoimbra.pt](http://oquefaltaemcoimbra.pt) ([pgaspar/oqfc](https://github.com/pgaspar/oqfc)), the work of a few Coimbra residents on the look for ideas of how to improve their city.

The idea of building the same app using multiple languages / frameworks comes from various other projects, like [TodoMVC](https://github.com/tastejs/todomvc).
