# PokeApp

## Network

### Dependencies

- Alamofire: Used for making HTTP requests.
- Combine: Used for handling asynchronous events and data streams.

### API Configuration

#### `APIConfig`

Stores the base URL for the Pokemon API.

- `baseURL`: The base URL pointing to the Pokemon API.

#### `APIEndpoint`

Enum that defines various API endpoints. It provides URL configurations for accessing different data points in the Pokemon API.

- `.pokemonList(limit: Int, offset: Int)`: Endpoint to fetch a paginated list of Pokemon.
- `.pokemonDetail(Int)`: Endpoint to fetch detailed information about a Pokemon by ID.
- `.pokemonByName(String)`: Endpoint to search for Pokemon by name.
- `.pokemonColor(Int)`: Endpoint to fetch the color data of a Pokemon by ID.
- `.pokemonSpecies(String)`: Endpoint to fetch detailed species information by name.

### Network Service

#### `NetworkServiceProtocol`

Defines the networking capabilities for fetching Pokemon data.

##### Methods

- `fetchEvolutionChain(from url: URL)`: Fetches the evolutionary chain of a Pokemon.
- `fetchPokemonSpecies(name: String)`: Fetches detailed information about a Pokemon species by name.
- `fetchPokemonList(limit: Int, offset: Int)`: Fetches a list of Pokemon with pagination.
- `fetchPokemonDetails(url: URL)`: Fetches detailed information about a specific Pokemon by URL.
- `fetchPokemonColor(id: Int)`: Fetches the color associated with a specific Pokemon.
- `fetchPokemonDetails(id: Int)`: Fetches detailed information about a specific Pokemon by ID.
- `searchPokemonByName(name: String)`: Searches for Pokemon by their name.

#### `NetworkService`

Implements `NetworkServiceProtocol` using Alamofire to execute network requests. It uses dependency injection for testability and flexibility.

### Caching and Dependency Injection

#### `CacheManagerServiceProtocol`

Defines caching operations to enhance performance and reduce network load.

- `get<T: Codable>(for key: String) -> T?`: Retrieves a cached item by key.
- `set<T: Codable>(_ item: T, for key: String)`: Caches an item with a specified key.

#### `DependencyContainer`

Manages dependencies using the Swinject library to facilitate testing and modularity.

- Provides centralized access to services like `NetworkService` and `CacheManager`.

### ViewModel Architecture

Base and specific view models handle data management and business logic, integrating with SwiftUI for UI updates.

- `BaseViewModel`: Common functionality for view models.
- `HomeScreenViewModel` and `DetailScreenViewModel`: Specific implementations for UI components.

### Theming and Styling

Handles visual aspects of the application, allowing theme changes dynamically based on system settings or user preferences.

- `ColorTheme`: Defines color schemes.
- `ThemeManager`: Manages the current theme.
- `TextStyle` and `CustomFont`: Custom font management.

### Extensions and Utilities

Provides additional functionalities like centering views in SwiftUI, adding custom fonts, etc.

- SwiftUI view extensions for common UI tasks.