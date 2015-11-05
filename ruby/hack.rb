class Fixnum

    def repeat_with_yield
        i = self
        while i > 0
            yield(i)
            i = i -1
        end
    end

    def repeat_with_method_call(&block)
       if(self > 0)
           block.call(self)
           (self -1).repeat_with_method_call(&block)
       end
    end


end

2.repeat_with_yield{ | i|  puts i  }
2.repeat_with_method_call{ | i|  puts i  }

