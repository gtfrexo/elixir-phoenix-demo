defmodule DbWeb.Schema.Types do

    use Absinthe.Schema.Notation
    use Absinthe.Ecto, repo: Db.Repo
    import_types(Absinthe.Type.Custom)

    object :context_val do

        field :id, non_null(:id)
        field :animal_blurb, :string
        field :boat_blurb, :string
        field :education_blurb, :string
        field :eggs_blurb, :string
        field :emoji_blurb, :string
        field :occupation_blurb, :string
        field :worst_pickup_blurb, :string

    end

    object :gender do

        field :id, non_null(:id)
        field :is_male, non_null(:boolean)
        field :is_female, non_null(:boolean)

    end

    object :location do

        field :id, non_null(:id)
        field :address, :string
        field :address_full, :string
        field :city, :string
        field :country, :string
        field :lat, non_null(:float)
        field :lon, non_null(:float)
        field :state, :string
        field :zip, :string

    end

    object :version do

        field :id, non_null(:id)
        field :current_version, :string
        field :target_version, :string

    end

    object :host do
        
        field :id, non_null(:id)
        field :description, :string
        field :name, non_null(:string)
        field :name_full, :string
        field :venue, :venue, resolve: assoc(:venue)

    end

    object :media do
        
        field :id, non_null(:id)
        field :deleted_at, :datetime
        field :description, :string
        field :media_type, :string
        field :url, non_null(:string)
        field :venue_id, :venue, resolve: assoc(:venue)
        field :event_id, :event, resolve: assoc(:event)
        field :created_at, non_null(:datetime)
        field :created_by, :person, resolve: assoc(:person)

    end

    object :message do
        
        field :id, non_null(:id)
        field :content, non_null(:string)
        field :read_at, :datetime
        field :from_person, :person, resolve: assoc(:person)
        field :to_person, :person, resolve: assoc(:person)
        field :sent_at, non_null(:datetime)

    end

    object :profile_content do

        field :id, non_null(:id)
        field :animal_blurb, :string
        field :boat_blurb, :string
        field :education_blurb, :string
        field :eggs_blurb, :string
        field :emoji_blurb, :string
        field :occupation_blurb, :string
        field :worst_pickup_blurb, :string
        field :person_id, :person, resolve: assoc(:person)

    end

    object :event do
        
        field :id, non_null(:id)
        field :created_by, :person, resolve: assoc(:person)
        field :location_id, :location, resolve: assoc(:location)
        field :pic, :media, resolve: assoc(:media)
        field :category, :string
        field :description, :string
        field :end_time, :datetime
        field :start_time, non_null(:datetime)
        field :title, non_null(:string)
        field :title_full, :string
        field :created_at, non_null(:datetime)
        field :pool_id, :pool, resolve: assoc(:pool)
        field :host_id, :host, resolve: assoc(:host)
        field :images, list_of(:media), resolve: assoc(:medias)
        field :venues, list_of(:venue), resolve: assoc(:venues)

    end

    object :person do
        
        field :id, non_null(:id)
        field :birthday, non_null(:datetime)
        field :email, non_null(:string)
        field :gender_id, :gender, resolve: assoc(:gender)
        field :name, non_null(:string)
        field :name_full, non_null(:string)
        field :target_gender, :string
        field :target_relationship, :string
        field :token, :string
        field :id_token, :string
        field :auth_token, :string
        field :email_verified, :boolean
        field :profile_content_id, :profile_content, resolve: assoc(:profile_content)
        field :profile_pic, :media, resolve: assoc(:media)
        field :auth0_me_id, :string
        field :bio, :string
        field :currently_blocking, list_of(:person), resolve: assoc(:persons)
        field :blocked_by, list_of(:person), resolve: assoc(:persons)
        field :created_events, list_of(:event), resolve: assoc(:events)
        field :sent_messages, list_of(:message), resolve: assoc(:messages)
        field :received_messages, list_of(:message), resolve: assoc(:messages)
        field :chatting_with, list_of(:person), resolve: assoc(:persons)
        field :interested_pools, list_of(:pool), resolve: assoc(:pools)
        field :viewed_pools, list_of(:pool), resolve: assoc(:pools)
        field :attending_pools, list_of(:pool), resolve: assoc(:pools)
        field :images, list_of(:media), resolve: assoc(:medias)

    end

    object :pool do
        
        field :id, non_null(:id)
        field :event_id, :event, resolve: assoc(:event)
        field :seatgeek_id, :string
        field :eventbrite_id, :string
        field :interested_persons, list_of(:person), resolve: assoc(:persons)
        field :attending_persons, list_of(:person), resolve: assoc(:persons)
        field :viewed_persons, list_of(:person), resolve: assoc(:persons)

    end

    object :venue do
        
        field :id, non_null(:id)
        field :category, :string
        field :description, :string
        field :name, non_null(:string)
        field :name_full, :string
        field :location_id, :location, resolve: assoc(:location)
        field :pic, :media, resolve: assoc(:media)
        field :events, list_of(:event), resolve: assoc(:events)
        field :hosts, list_of(:host), resolve: assoc(:hosts)
        field :images, list_of(:media), resolve: assoc(:medias)

    end

    object :test do

        field :id, non_null(:id)
        field :testing, :string
        field :gender_id, :gender, resolve: assoc(:gender)

    end


end