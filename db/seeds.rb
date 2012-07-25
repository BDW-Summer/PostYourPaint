["Blacks", "Blues", "Browns", "Creams", "Greens", "Greys", "Oranges", "Purples", "Reds", "Whites", "Yellows"].each do |color_family|
    ColorFamily.find_or_create_by_name color_family
end
