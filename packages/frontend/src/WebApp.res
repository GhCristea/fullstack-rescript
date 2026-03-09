@react.component
let make = () => {
  let (apiStatus, setApiStatus) = React.useState(() => "checking...")

  React.useEffect0(() => {
    let load = async () => {
      let res = await Fetch.fetch("/api" ++ Routes.Health.path)
      let raw = await res->Fetch.Response.json
      
      // Manual validation: check response shape
      switch (raw->Js.Dict.get("status"), raw->Js.Dict.get("timestamp")) {
      | (Some(status), Some(timestamp)) =>
        switch (Js.Json.decodeString(status), Js.Json.decodeString(timestamp)) {
        | (Some(statusStr), Some(_)) => setApiStatus(_ => statusStr)
        | _ => setApiStatus(_ => "invalid response")
        }
      | _ => setApiStatus(_ => "invalid response")
      }
    }
    let _ = load()
    None
  })

  <main>
    <h1> {React.string("fullstack-rescript")} </h1>
    <p> {React.string("API: " ++ apiStatus)} </p>
  </main>
}
