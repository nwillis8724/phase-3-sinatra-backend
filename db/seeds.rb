puts "🌱 Seeding spices..."

# Seed your database here
Game.create([
    {
        name: "Zelda",
        genre: "RPG",
        developer_id: 1,
        price: 55
    },
    {
        name: "Skyrim",
        genre: "RPG",
        developer_id: 2,
        price: 35
    },
    {
        name: "Call of Duty",
        genre: "Shooter",
        developer_id: 3,
        price: 45
    },
    {
        name: "Tetris",
        genre: "Puzzle",
        developer_id: 4,
        price: 5
    },
    {
        name: "RuneScape",
        genre: "MMO",
        developer_id: 5,
        price: 15
    },
    {
        name: "Mario Party",
        genre: "Party",
        developer_id: 1,
        price: 15
    },
])

Developer.create([
    {
        developer: "Nintendo",
    },
    {
        developer: "Bethesda",
    },
    {
        developer: "Activision",
    },
    {
        developer: "Alexey Pajitnov",
    },
    {
        developer: "Jagex",
    }

])

puts "✅ Done seeding!"
