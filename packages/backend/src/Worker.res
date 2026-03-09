// Cloudflare Workers entry point
let app = Api.make()

%%raw(`export default { fetch: (req, env, ctx) => app.fetch(req, env, ctx) }`)
