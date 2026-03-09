module S = RescriptSchema

// Contract layer: paths, request/response types, and schemas.
// Import this package in both backend and frontend to stay in sync.

// ── Health ────────────────────────────────────────────────────────────────────────────
module Health = {
  let path = "/health"

  module Get = {
    module Response = {
      type t = {status: string, timestamp: string}

      let schema = S.object(s => {
        status: s.field("status", S.string),
        timestamp: s.field("timestamp", S.string),
      })
    }
  }
}

// ── Users ────────────────────────────────────────────────────────────────────────────
module Users = {
  let basePath = "/users"

  type user = {id: string, name: string, email: string}

  let userSchema = S.object(s => {
    id: s.field("id", S.string),
    name: s.field("name", S.string),
    email: s.field("email", S.string),
  })

  module GetAll = {
    let path = basePath

    module Response = {
      type t = array<user>
      let schema = S.array(userSchema)
    }
  }

  module Create = {
    let path = basePath

    module Request = {
      type t = {name: string, email: string}

      let schema = S.object(s => {
        name: s.field("name", S.string),
        email: s.field("email", S.string),
      })
    }

    module Response = {
      type t = user
      let schema = userSchema
    }
  }

  module GetById = {
    let path = basePath ++ "/:id"

    module Response = {
      type t = user
      let schema = userSchema
    }
  }
}
