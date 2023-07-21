for i = 1, 16 do
    local name, count
    name, count = turtle.getItemDetail(i)

    if name then
        print(name)
    end
end
