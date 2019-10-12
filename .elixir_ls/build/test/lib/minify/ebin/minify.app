{application,minify,
             [{applications,[kernel,stdlib,elixir,logger,runtime_tools,
                             gettext,jason,phoenix_pubsub,postgrex,ecto_sql,
                             plug_cowboy,phoenix,phoenix_ecto]},
              {description,"minify"},
              {modules,['Elixir.Minify','Elixir.Minify.Application',
                        'Elixir.Minify.DataCase','Elixir.Minify.Domain',
                        'Elixir.Minify.Domain.Url','Elixir.Minify.Repo',
                        'Elixir.MinifyWeb','Elixir.MinifyWeb.ChangesetView',
                        'Elixir.MinifyWeb.ChannelCase',
                        'Elixir.MinifyWeb.ConnCase',
                        'Elixir.MinifyWeb.Endpoint',
                        'Elixir.MinifyWeb.ErrorHelpers',
                        'Elixir.MinifyWeb.ErrorView',
                        'Elixir.MinifyWeb.FallbackController',
                        'Elixir.MinifyWeb.Gettext','Elixir.MinifyWeb.Router',
                        'Elixir.MinifyWeb.Router.Helpers',
                        'Elixir.MinifyWeb.UrlController',
                        'Elixir.MinifyWeb.UrlView',
                        'Elixir.MinifyWeb.UserSocket']},
              {registered,[]},
              {vsn,"0.1.0"},
              {mod,{'Elixir.Minify.Application',[]}}]}.