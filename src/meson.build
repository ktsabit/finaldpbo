finaldpbo_sources = [
  'main.vala',
  'application.vala',
  'window.vala',
  'httputils.vala',
  'db_utils/db.vala'
]

finaldpbo_deps = [
  dependency('gtk4'),
  dependency('gee-0.8'),
  dependency('libsoup-3.0'),
  dependency('json-glib-1.0'),
  dependency('sqlite3')
]

finaldpbo_sources += gnome.compile_resources('finaldpbo-resources',
  'finaldpbo.gresource.xml',
  c_name: 'finaldpbo'
)

executable('finaldpbo', finaldpbo_sources,
  dependencies: finaldpbo_deps,
       install: true,
)
