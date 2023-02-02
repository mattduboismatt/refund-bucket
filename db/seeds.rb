Dealer.create!([
  {
    name: "American Airlines",
    category: Dealer::Categories::AIRLINE,
    slug: "american-airlines",
    image: "american-airlines.png"
  },
  {
    name: "Southwest Airlines",
    category: Dealer::Categories::AIRLINE,
    slug: "southwest-airlines",
    image: "southwest-airlines.png"
  },
  {
    name: "United Airlines",
    category: Dealer::Categories::AIRLINE,
    slug: "united-airlines",
    image: "united-airlines.png"
  },
  {
    name: "Marriott",
    category: Dealer::Categories::HOTEL,
    slug: "marriott",
    image: "marriott.png"
  },
  {
    name: "Hilton",
    category: Dealer::Categories::HOTEL,
    slug: "hilton"
  },
  {
    name: "Enterprise",
    category: Dealer::Categories::CAR_RENTAL,
    slug: "enterprise"
  },
  {
    name: "Hertz",
    category: Dealer::Categories::CAR_RENTAL,
    slug: "hertz"
  },
  {
    name: "Amazon",
    category: Dealer::Categories::E_COMMERCE,
    slug: "amazon",
    image: "amazon.png"
  },
  {
    name: "Lululemon",
    category: Dealer::Categories::E_COMMERCE,
    slug: "lululemon"
  }
])
