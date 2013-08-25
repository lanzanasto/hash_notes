ActsAsFerret::define_index( 'note_index',
                            :models => {
                              Note => {
                                :fields => {
                                  :content => { :boost => 4, :store => :yes, :via => :ferret_content }
                                }
                              }
                            }
                          )