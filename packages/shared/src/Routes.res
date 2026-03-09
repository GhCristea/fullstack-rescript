// Contract layer: paths and request/response types.
// Import this package in both backend and frontend to stay in sync.

// ── Health ────────────────────────────────────────────────────────────────────────────
module Health = {
  let path = "/health"

  module Get = {
    module Response = {
      type t = {status: string, timestamp: string}
    }
  }
}

// ── Users ────────────────────────────────────────────────────────────────────────────
module Users = {
  let basePath = "/users"

  type user = {id: string, name: string, email: string}

  module GetAll = {
    let path = basePath

    module Response = {
      type t = array<user>
    }
  }

  module Create = {
    let path = basePath

    module Request = {
      type t = {name: string, email: string}
    }

    module Response = {
      type t = user
    }
  }

  module GetById = {
    let path = basePath ++ "/:id"

    module Response = {
      type t = user
    }
  }
}
