// Minimal Hono bindings for Cloudflare Workers
// Extend as needed — https://hono.dev/docs

type t
type context
type req
type response

@module("hono") @new
external make: unit => t = "Hono"

// Route registration
@send external get: (t, string, context => promise<response>) => t = "get"
@send external post: (t, string, context => promise<response>) => t = "post"
@send external put: (t, string, context => promise<response>) => t = "put"
@send external del: (t, string, context => promise<response>) => t = "delete"
@send external patch: (t, string, context => promise<response>) => t = "patch"

// Context — request
@get external req: context => req = "req"
@send external parseJson: req => promise<'a> = "json"
@send external param: (req, string) => string = "param"

// Context — response helpers
@send external json: (context, 'body) => response = "json"
@send external jsonWithStatus: (context, 'body, int) => response = "json"
@send external text: (context, string) => response = "text"

// Workers entry fetch handler
@send external fetch: (t, 'request, 'env, 'ctx) => promise<response> = "fetch"
