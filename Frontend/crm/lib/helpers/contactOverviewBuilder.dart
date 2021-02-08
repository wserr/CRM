import 'package:crm/models/contact.dart';

/**
 * This class is intended for testing, creates a dummy list with contacts
 */
class ContactOverviewBuilder {
  static List<Contact> buildContacts() {
    List<Contact> contacts = [];
    contacts.add(Contact('Willem', 1));
    contacts.add(Contact('Florine', 2));
    contacts.add(Contact('Tag', 3));
    contacts.add(Contact('Test', 4));
    contacts.add(Contact('Koenraad', 5));
    contacts.add(Contact('Test 2', 6));
    contacts.add(Contact('Test 3', 7));
    contacts.add(Contact('Bert', 8));
    contacts.add(Contact('Trui', 9));
    contacts.add(Contact('Aap', 10));
    contacts.add(Contact('Testen', 11));
    contacts.add(Contact('Test 10', 12));
    contacts.add(Contact('23456', 13));
    contacts.add(Contact('Testtest', 14));
    return contacts;
  }
}
