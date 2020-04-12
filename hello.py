def app(environ, start_response):
    data = environ["QUERY_STRING"].replace("&", "\n").encode()

    start_response("200 OK", [
        ("Content-Type", "text/plain"),
        ("Content-Length", str(len(data)))
    ])
    return iter([data])
