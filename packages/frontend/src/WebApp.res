@react.component
let make = () => {
  let (apiStatus, setApiStatus) = React.useState(() => "checking...")

  React.useEffect0(() => {
    let load = async () => {
      let res = await Fetch.fetch("/api" ++ Routes.Health.path)
      let raw = await res->Fetch.Response.json
      
      // Manual validation: check response shape
      switch (raw->Dict.get("status"), raw->Dict.get("timestamp")) {
      | (Some(statusJson), Some(_)) =>
        switch statusJson->JSON.Decode.string {
        | Some(statusStr) => setApiStatus(_ => statusStr)
        | None => setApiStatus(_ => "invalid response")
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
