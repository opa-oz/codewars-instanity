local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local generate_hashtag = require 'solution'.generate_hashtag

describe('Basic tests', function()
    it('false', function() assert.are.same(false, generate_hashtag '', 'Expected an empty string to return False') end)
    it('#',
    function() assert.are.same('#', generate_hashtag 'Do We have A Hashtag':sub(1, 1),
        'Expeted a Hashtag (#) at the beginning.') end)
    it('#Codewars',
    function() assert.are.same('#Codewars', generate_hashtag 'Codewars', 'Should deal with unnecessary middle spaces.') end)
    it('#Codewars',
    function() assert.are.same('#Codewars', generate_hashtag 'Codewars      ', 'Should handle trailing whitespace.') end)
    it('#CodewarsIsNice',
    function() assert.are.same('#CodewarsIsNice', generate_hashtag 'Codewars Is Nice', 'Should remove spaces.') end)
    it('#CodewarsIsNice',
    function() assert.are.same('#CodewarsIsNice', generate_hashtag 'codewars is nice',
        'Should capitalize first letters of words.') end)
    it('#CodewarsIsNice',
    function() assert.are.same('#CodewarsIsNice', generate_hashtag 'CodeWars is nice',
        'Should capitalize all letters of words - all lower case but the first.') end)
    it('#CIN',
    function() assert.are.same('#CIN', generate_hashtag 'c i n',
        'Should capitalize first letters of words even when single letters.') end)
    it('#CodewarsIsNice',
    function() assert.are.same('#CodewarsIsNice', generate_hashtag 'codewars  is  nice',
        'Should deal with unnecessary middle spaces.') end)
    it('false',
    function() assert.are.same(false,
        generate_hashtag 'Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat',
        'Should return False if the final word is longer than 140 chars.') end)
end)
