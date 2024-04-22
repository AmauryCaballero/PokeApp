# PokeApp

## Network

### Dependencies

- Alamofire: Used for making HTTP requests.
- Combine: Used for handling asynchronous events and data streams.

### API Configuration

#### `APIConfig`

Holds the base URL for the Pokemon API.

- `baseURL`: The base URL pointing to the Pokemon API.

#### `APIEndpoint`

Enum that defines various API endpoints.

- `.pokemonList(limit: Int, offset: Int)`: Endpoint to fetch a paginated list of Pokemon.
- `.pokemonDetail(Int)`: Endpoint to fetch detailed information about a Pokemon by ID.
- `.pokemonByName(String)`: Endpoint to search for Pokemon by name.

### Network Service

#### `NetworkServiceProtocol`
Defines the networking capabilities for fetching Pokemon data.

##### Methods

- `fetchPokemonList(limit: Int, offset: Int)`: Fetches a list of Pokemon with pagination.
- `fetchPokemonDetails(id: Int)`: Fetches detailed information about a specific Pokemon.
- `searchPokemonByName(name: String)`: Searches for Pokemon by their name.

#### `NetworkService`
Implements `NetworkServiceProtocol` using Alamofire for network requests.

- Uses `Session` from Alamofire to handle network tasks.
- Provides flexibility and testability by allowing dependency injection of the network session.