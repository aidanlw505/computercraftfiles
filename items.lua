for i = 0, 15 do
    local name, count
    name, count = turtle.getItemDetail(i)

    if name then
        print(name)
    end
end
