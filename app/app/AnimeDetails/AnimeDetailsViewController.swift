import UIKit

class AnimeDetailsViewController: UIViewController {
    var animeModel: [String: Anime] = [:]
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    private lazy var titleView: UILabel = {
        let view = UILabel()
        return view
    }()
    
    private lazy var synopsisView: UILabel = {
        let view = UILabel()
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        titleView.textColor = .white
        synopsisView.textColor = .white
        addSubviews()
        makeConstraints()
        configure()
    }
    
    func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleView)
        stackView.addArrangedSubview(synopsisView)
        stackView.spacing = 8
    }
    
    func makeConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let margins = view.layoutMarginsGuide

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: margins.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func configure() {
        let anime = Array(animeModel.values)[0]
        titleView.font = UIFont.systemFont(ofSize: 16)
        titleView.numberOfLines = 5
        synopsisView.font = UIFont.systemFont(ofSize: 16)
        synopsisView.numberOfLines = 0
        
        if let imageURL = anime.images?.jpg?.imageUrl {
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: imageURL) {
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: imageData)
                    }
                }
            }
        }
        
        titleView.text = "\(anime.title)\n\(anime.titleJapanese)\nEpisodes: \(anime.episodes ?? 0)\nGenre: \(anime.genres?.first?.name ?? "N/A")\nDescription:"
        synopsisView.text = anime.synopsis
    }
}
