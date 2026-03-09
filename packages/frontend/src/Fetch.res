// Web Fetch API bindings

type response

@val external fetch: string => promise<response> = "fetch"

module Response = {
  @send external json: response => promise<'a> = "json"
  @send external text: response => promise<string> = "text"
  @get external ok: response => bool = "ok"
  @get external status: response => int = "status"
}
