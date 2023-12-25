finaldpbo_sources = [
  'main.vala',
  'application.vala',
  'window.vala',
]

finaldpbo_deps = [
  dependency('gtk4'),
]

finaldpbo_sources += gnome.compile_resources('finaldpbo-resources',
  'finaldpbo.gresource.xml',
  c_name: 'finaldpbo'
)

executable('finaldpbo', finaldpbo_sources,
  dependencies: finaldpbo_deps,
       install: true,
)
