finaldpbo_sources = [
  'main.vala',
  'application.vala',
  'utils/httputils.vala',
  'input_window.vala',
  'product_window.vala',
  'models/distributor.vala',
  'models/peternakan.vala',
  'models/batch.vala',
  'utils/jsonParser.vala',
]

finaldpbo_deps = [
  dependency('gtk4'),
  dependency('gee-0.8'),
  dependency('libsoup-3.0'),
  dependency('json-glib-1.0'),
]

finaldpbo_sources += gnome.compile_resources('finaldpbo-resources',
  'finaldpbo.gresource.xml',
  c_name: 'finaldpbo'
)

executable('finaldpbo', finaldpbo_sources,
  dependencies: finaldpbo_deps,
       install: true,
)
