for i = 1, 16 do
    local output
    output = turtle.getItemDetail(i)

    if output then
        print(output.name)
    end
end
