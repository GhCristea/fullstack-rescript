@react.component
let make = () => {
  let (apiStatus, setApiStatus) = React.useState(() => "checking...")

  React.useEffect0(() => {
    let load = async () => {
      let res = await Fetch.fetch("/api" ++ Routes.Health.path)
      let raw = await res->Fetch.Response.json
      switch raw->S.parseWith(Routes.Health.Get.Response.schema) {
      | Ok(data) => setApiStatus(_ => data.status)
      | Error(_) => setApiStatus(_ => "parse error")
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
