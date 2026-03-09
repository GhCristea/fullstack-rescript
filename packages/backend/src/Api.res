// Application router — wire routes to handlers here
open Routes

let make = () => {
  let app = Hono.make()

  // GET /health
  let _ = app->Hono.get(Health.path, async c => {
    let res: Health.Get.Response.t = {
      status: "ok",
      timestamp: Js.Date.make()->Js.Date.toISOString,
    }
    c->Hono.json(res)
  })

  // GET /users
  let _ = app->Hono.get(Users.GetAll.path, async c => {
    let users: Users.GetAll.Response.t = []
    c->Hono.json(users)
  })

  // POST /users
  let _ = app->Hono.post(Users.Create.path, async c => {
    let raw = await c->Hono.req->Hono.parseJson
    switch raw->S.parseWith(Users.Create.Request.schema) {
    | Ok(input) =>
      let created: Users.user = {id: "todo-uuid", name: input.name, email: input.email}
      c->Hono.jsonWithStatus(created, 201)
    | Error(e) =>
      c->Hono.jsonWithStatus({"error": e->S.Error.message}, 400)
    }
  })

  // GET /users/:id
  let _ = app->Hono.get(Users.GetById.path, async c => {
    let id = c->Hono.req->Hono.param("id")
    let user: Users.user = {id, name: "Placeholder", email: "placeholder@example.com"}
    c->Hono.json(user)
  })

  app
}
