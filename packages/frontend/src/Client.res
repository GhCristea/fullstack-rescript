switch ReactDOM.querySelector("#root") {
| Some(root) =>
  let reactRoot = ReactDOM.Client.createRoot(root)
  reactRoot->ReactDOM.Client.Root.render(<WebApp />)
| None => Console.error("Root element #root not found")
}
