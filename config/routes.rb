Rails.application.routes.draw do
  get 'search', to: "searches#search"
  get 'jonson', to: "searches#jonson"
  get 'tvjon', to: "searches#tvjon"
end
