class GameAuth < Auth
	def valid_difficulty?(d)
		d = d.to_i
		if d >= GameModel.min_disks && d <= GameModel.max_disks
			return true
		else
			@error = "Invalid difficulty value: #{d.to_s}"
			return false
		end
	end

	def valid_from?(game, from)
		if from == ''
			@error = "Invalid stack origin number: #{from.to_i.to_s}"
			return false
		elsif ! game[from.to_i - 1] || game[from.to_i - 1].empty?
			@error = "Invalid stack origin number: #{from.to_i.to_s}"
			return false
		end
		return true
	end

	def valid_to?(game, from, to)
		if to == ''
			@error = "Invalid stack destination number: #{to.to_i.to_s}"
			return false
		elsif ! game[from.to_i - 1] || ! game[to.to_i - 1]
			@error = "Cannot move from: #{from.to_i.to_s} to: #{to.to_i.to_s}"
			return false
		elsif game[to.to_i - 1].first && game[from.to_i - 1].first > game[to.to_i - 1].first
			@error = "Cannot move larger disk onto smaller disk"
			return false
		end
		return true
	end
end