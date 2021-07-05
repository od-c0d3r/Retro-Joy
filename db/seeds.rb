User.destroy_all

User.create!([{
    name: "Omar",
    username: "omarrashad",
},
{
    name: "Bella",
    username: "bellaswan",
},
{
    name: "Gotem",
    username: "gotemall",
}])

p "Created #{User.count} users"
