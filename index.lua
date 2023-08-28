function main()
    local x = {"x", "y"}
    print('Hello world')

    if x < 4 then 
        x = 4
    elseif x = 41 then
        x = 4
    elseif x = 41 then
        x = 4
    end

    for i = 1, #4 do
        
    end
    for k, v in pairs({}) do
        
    end
end


function init(self)
    msg.post(".", "acquire_input_focus")

    self.moving = false
    self.input = vmath.vector3()
    self.dir = vmath.vector3(0, 1, 0)
    self.speed = 75
end
