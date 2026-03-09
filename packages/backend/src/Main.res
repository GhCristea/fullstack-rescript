// Cloudflare Workers entry point
let app = App.make()

%%raw(`export default { fetch: (req, env, ctx) => app.fetch(req, env, ctx) }`)
