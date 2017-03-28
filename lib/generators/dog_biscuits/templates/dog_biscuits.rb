# load dog_biscuits config
DOGBISCUITS = YAML.load(File.read(File.expand_path('../../dog_biscuits.yml', __FILE__))).with_indifferent_access
# include Terms