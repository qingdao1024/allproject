{application, gc,
 [{description, "gc"},
  {vsn, "0.01"},
  {modules, [
    gc,
    gc_app,
    gc_sup,
    gc_web,
    gc_deps
  ]},
  {registered, []},
  {mod, {gc_app, []}},
  {env, []},
  {applications, [kernel, stdlib, crypto]}]}.
