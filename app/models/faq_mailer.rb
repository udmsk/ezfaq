# ezFAQ plugin for redMine
# Copyright (C) 2008-2009  Zou Chaoqun
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

class FaqMailer < Mailer

  def faq_add(project, faq)    
    redmine_headers 'Project' => faq.project.identifier,
                    'Faq-Id' => faq.id,
                    'Faq-Author' => faq.author.login
    
    recipients  [ faq.author.mail ]
    recipients << faq.assigned_to.mail if faq.assigned_to

    subject "[#{faq.project.name} - #{l(:label_faq_new)} - FAQ##{faq.id}] #{faq.question}"
    body :faq => faq,
         :faq_url => url_for(:controller => 'ezfaq', :action => 'show', :id => project, :faq_id => faq)
  end
  
  def faq_update(project, faq)    
    redmine_headers 'Project' => faq.project.identifier,
                    'Faq-Id' => faq.id,
                    'Faq-Author' => faq.author.login
    
    recipients  [ faq.author.mail ]
    recipients << faq.assigned_to.mail if faq.assigned_to

    subject "[#{faq.project.name} - #{l(:label_faq_updated)} - FAQ##{faq.id}] #{faq.question}"
    body :faq => faq,
         :faq_url => url_for(:controller => 'ezfaq', :action => 'show', :id => project, :faq_id => faq)
  end
  
end
