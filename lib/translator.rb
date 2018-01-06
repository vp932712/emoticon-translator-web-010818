require 'yaml'


def load_library(path)
  emoticons = YAML.load_file(path)
  emoticon_hash = Hash.new

  emoticon_hash["get_emoticon"] = Hash.new
  emoticon_hash["get_meaning"] = Hash.new

  emoticons.each do |word, emoticon_set|
    emoticon_hash["get_emoticon"][emoticon_set.first] = emoticon_set.last
    emoticon_hash["get_meaning"][emoticon_set.last] = word
  end
  emoticon_hash
end

def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  final = emoticon_hash["get_emoticon"][emoticon]
  if final == nil
    final = "Sorry, that emoticon was not found"
  end
  final
end

def get_english_meaning(path, emoticon)
  emoticon_hash = load_library(path)
  final = emoticon_hash["get_meaning"][emoticon]
  if final == nil
    final = "Sorry, that emoticon was not found"
  end
  final
end
