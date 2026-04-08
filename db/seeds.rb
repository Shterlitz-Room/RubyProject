require "open-uri"

User.destroy_all
Product.destroy_all

User.create!(
  email: "demo@example.com",
  password: "password12",
  password_confirmation: "password12"
)

def seed_image(product, text)
  product.image.attach(
    io: URI.open("https://placehold.co/600x600/e63946/ffffff?text=#{CGI.escape(text)}"),
    filename: "item.jpg"
  )
end

items = [
  {
    name: "Шрек лесной",
    description: "Футболка оверсайз, 100% хлопок.",
    price: 10_000,
    compare_at_price: 12_500,
    category: "tshirt",
    gender: "male",
    sizes: %w[S M L XL],
    img: "Шрек"
  },
  {
    name: "Джинсы классика",
    description: "Прямой крой, плотный деним.",
    price: 8_500,
    compare_at_price: nil,
    category: "jeans",
    gender: "all",
    sizes: %w[30 32 34 36],
    img: "Jeans"
  },
  {
    name: "Куртка ветровка",
    description: "Лёгкая непродуваемая ткань.",
    price: 12_000,
    compare_at_price: 15_000,
    category: "jacket",
    gender: "female",
    sizes: %w[S M L],
    img: "Куртка"
  },
  {
    name: "Футболка базовая",
    description: "Белая база на каждый день.",
    price: 2_200,
    compare_at_price: 2_800,
    category: "tshirt",
    gender: "female",
    sizes: %w[XS S M L XL],
    img: "База"
  },
  {
    name: "Джинсы скинни",
    description: "Эластичная ткань, комфортная посадка.",
    price: 7_200,
    compare_at_price: nil,
    category: "jeans",
    gender: "female",
    sizes: %w[26 28 30 32],
    img: "Скинни"
  },
  {
    name: "Куртка демисезон",
    description: "Утеплитель, капюшон.",
    price: 18_000,
    compare_at_price: 22_000,
    category: "jacket",
    gender: "male",
    sizes: %w[M L XL XXL],
    img: "Деми"
  }
]

items.each do |attrs|
  img = attrs.delete(:img)
  p = Product.create!(attrs)
  seed_image(p, img)
end
