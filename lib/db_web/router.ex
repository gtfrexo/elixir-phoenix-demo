defmodule DbWeb.Router do
  use DbWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DbWeb do
    pipe_through :api

    resources "/context_vals", Context_ValController, except: [:new, :edit]
    resources "/genders", GenderController, except: [:new, :edit]
    resources "/locations", LocationController, except: [:new, :edit]
    resources "/versions", VersionController, except: [:new, :edit]
    resources "/hosts", HostController, except: [:new, :edit]
    resources "/medias", MediaController, except: [:new, :edit]
    resources "/messages", MessageController, except: [:new, :edit]
    resources "/profile_contents", Profile_ContentController, except: [:new, :edit]
    resources "/events", EventController, except: [:new, :edit]
    resources "/persons", PersonController, except: [:new, :edit]
    resources "/pools", PoolController, except: [:new, :edit]
    resources "/venues", VenueController, except: [:new, :edit]
    resources "/tests", TestController, except: [:new, :edit]
  end

  forward "/api", Absinthe.Plug, 
    schema: DbWeb.Schema

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: DbWeb.Schema

end
