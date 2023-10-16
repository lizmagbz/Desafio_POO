import UIKit

// Representa um único filme
class Movie {
    var title: String
    var director: String
    var releaseYear: Int
    var genre: Genre
    var availableSeats: Int
    var id: UUID
    
    init(title: String, director: String, releaseYear: Int, genre: Genre, availableSeats: Int, id: UUID ) {
        self.title = title
        self.director = director
        self.releaseYear = releaseYear
        self.genre = genre
        self.availableSeats = availableSeats
        self.id = id
    }
    
    //  Atualiza a quantidade de acentos disponíveis.
    func updateAvailableSeats(numberTickets: Int) {
        self.availableSeats -= numberTickets
    }
}

// Representa os gêneros de filmes que o cinema tem disponível.
enum Genre {
    case acao
    case comedia
    case drama
    case romance
    case suspense
    case terror
    case animacao
    case ficcaoCientifica
    case aventura
    case musical
    case fantasia
}

// Representa a reserva de um filme
struct Reservation {
    var movie: Movie
    var numberTicketsReserved: Int
    var clientName: String
    
}

// Representa o cinema
class Cinema {
    var listMovie: [Movie]
    var listReservation: [Reservation]
    
    init(listMovie: [Movie], listReservation: [Reservation]) {
        self.listMovie = listMovie
        self.listReservation = listReservation
    }
    
    // Adiciona filmes em uma lista de filmes
    func addMovies(listMovie: Movie) {
        self.listMovie.append(listMovie)
    }
    
    // Permite a reserva para um determinado filme
    func reservationTicket(movie: Movie, clientName: String, numberTicketsReserved: Int) {
        if !listMovie.contains(where: { $0.id == movie.id }) {
            print("O filme \(movie.title) está indisponível")
            return
        }
        if movie.availableSeats >= numberTicketsReserved {
            listReservation.append(Reservation(movie: movie, numberTicketsReserved: numberTicketsReserved, clientName: clientName))
            movie.updateAvailableSeats(numberTickets: numberTicketsReserved)
            print("Sua reserva para o filme \(movie.title) foi realizada com sucesso")
        } else {
            print("Infelizmente sua reserva exede o número de ingressos disponíveis")
        }
    }
    
    // Listagem das reservas feitas por um cliente específico
    func reservationByClient(clientName: String) -> [Reservation] {
        return listReservation.filter { $0.clientName == clientName }
    }
    
    // Listagem dos filmes disponíveis de um gênero
    func getMoviesByGenre(genre: Genre) -> [Movie] {
        return listMovie.filter { movie in
            movie.genre == genre
        }
    }
}

// Filmes
let movie1 = Movie(title: "Som de liberdade", director: "Alejandro Monteverde", releaseYear: 2023, genre: .acao, availableSeats: 20, id: UUID())
let movie2 = Movie(title: "Viva - A Vida é uma Festa", director: "Adrian Molina, Lee Unkriche", releaseYear: 2017, genre: .animacao, availableSeats: 14, id: UUID())
let movie3 = Movie(title: "Jumanji: Bem-vindo à Selva", director: "Jake Kasdan", releaseYear: 2017, genre: .aventura, availableSeats: 15, id: UUID())
let movie4 = Movie(title: "Missão Resgate", director: "Jonathan Hensleigh", releaseYear: 2021, genre: .acao, availableSeats: 20, id: UUID())
let movie5 = Movie(title: "Que Horas Eu Te Pego?", director: "Gene Stupnitsky", releaseYear: 2023, genre: .comedia, availableSeats: 10, id: UUID())
let movie6 = Movie(title: "Gente Grande 2", director: "Dennis Dugan", releaseYear: 2013, genre: .comedia, availableSeats: 12, id: UUID())
let movie7 = Movie(title: "Continência ao Amor", director: "Elizabeth Allen Rosenbaum", releaseYear: 2022, genre: .drama, availableSeats: 16, id: UUID())
let movie8 = Movie(title: "A Bússola de Ouro", director: "Chris Weitz", releaseYear: 2007, genre: .fantasia, availableSeats: 22, id: UUID())
let movie9 = Movie(title: "Babylon 5: O Caminho", director: "Matt Peters", releaseYear: 2023, genre: .ficcaoCientifica, availableSeats: 10, id: UUID())
let movie10 = Movie(title: "O Rei do Show", director: "Michael Gracey", releaseYear: 2017, genre: .musical, availableSeats: 12, id: UUID())
let movie11 = Movie(title: "Minha Culpa", director: "Domingo González", releaseYear: 2023, genre: .romance, availableSeats: 25, id: UUID())
let movie12 = Movie(title: "Destinos à Deriva", director: "Albert Pintó", releaseYear: 2023, genre: .suspense, availableSeats: 29, id: UUID())
let movie13 = Movie(title: "Amor à Primeira Vista", director: "Vanessa Caswill", releaseYear: 2023, genre: .romance, availableSeats: 19, id: UUID())
let movie14 = Movie(title: "Sorria", director: "Parker Finn", releaseYear: 2022, genre: .terror, availableSeats: 30, id: UUID())
    
// instância de cinema já com alguns filmes disponíveis
let cinema = Cinema(listMovie: [movie1, movie2, movie4, movie13, movie7, movie6, movie12, movie8, movie3, movie11], listReservation: [])

cinema.addMovies(listMovie: movie13)

// Realizando a reserva de um filme e acentos por cliente
cinema.reservationTicket(movie: movie7, clientName: "Maria", numberTicketsReserved: 2)
cinema.reservationTicket(movie: movie5, clientName: "Pedro", numberTicketsReserved: 10)
cinema.reservationTicket(movie: movie2, clientName: "Maria", numberTicketsReserved: 1)
cinema.reservationTicket(movie: movie1, clientName: "Sofia", numberTicketsReserved: 5)

// Conferindo acentos disponíveis
print(movie1.availableSeats)
print(movie3.availableSeats)

// Listando os filmes por gênero
let actionMovies = cinema.getMoviesByGenre(genre: .comedia)

// Listando as reservas de um cliente
let reservationTati = cinema.reservationByClient(clientName: "Maria")

